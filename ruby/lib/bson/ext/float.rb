# encoding: utf-8
module BSON
  module Ext

    # Injects behaviour for encoding and decoding floating point values
    # to and from # raw bytes as specified by the BSON spec.
    #
    # @see http://bsonspec.org/#/specification
    #
    # @since 2.0.0
    module Float

      # A floating point is type 0x01 in the BSON spec.
      #
      # @since 2.0.0
      BSON_TYPE = 1.chr.freeze

      # The pack directive is for 8 byte floating points.
      #
      # @since 2.0.0
      DOUBLE_PACK = "E".freeze

      # Get the BSON single byte type for a floating point value.
      #
      # @example Get the bson type.
      #   1.223223.bson_type
      #
      # @return [ String ] 0x01.
      #
      # @see http://bsonspec.org/#/specification
      #
      # @since 2.0.0
      def bson_type
        BSON_TYPE
      end

      # Get the floating point as encoded BSON.
      #
      # @example Get the floating point as encoded BSON.
      #   1.221311.to_bson
      #
      # @return [ String ] The encoded string.
      #
      # @see http://bsonspec.org/#/specification
      #
      # @since 2.0.0
      def to_bson
        [ self ].pack(DOUBLE_PACK)
      end
    end

    # Enrich the core Float class with this module.
    #
    # @since 2.0.0
    ::Float.send(:include, Float)
  end
end
