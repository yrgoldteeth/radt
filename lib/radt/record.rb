module RADT
  # An instance of RADT::Record represents a row in the RADT file
  class Record
    extend Forwardable
    attr_reader :attributes

    def_delegators :@table, :columns

    # Initialize a new ADT::Record
    #
    # @param [RADT::Table] table
    def initialize(table)
      @table, @data = table, table.data

      initialize_values
      define_accessors
    end

    # Equality
    #
    # @param [RADT::Record] other
    # @return [Boolean]
    def ==(other)
      other.respond_to?(:attributes) && other.attributes == attributes
    end

    # Maps a row to an array of values
    #
    # @return [Array]
    def to_a
      columns.map { |column| @attributes[column.name.underscore] }
    end

    private

    # Defined attribute accessor methods
    def define_accessors
      columns.each do |column|
        underscored_column_name = column.name.underscore
        unless respond_to?(underscored_column_name)
          self.class.send :define_method, underscored_column_name do
            @attributes[column.name.underscore]
          end
        end
      end
    end

    # Initialize values for a row
    def initialize_values
      #skip the first 5 bytes, don't know what they are for and they don't contain the data.
      @data.read(5)

      @attributes = columns.inject({}) do |hash, column|

        #get the unpack flag to get this data.
        value = @data.read(column.length).unpack("#{column.flag(column.type, column.length)}").first
        hash[column.name] = value
        hash[column.name.underscore] = value

        hash
      end
    end


  end
end
