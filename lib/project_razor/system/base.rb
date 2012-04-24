# EMC Confidential Information, protected under EMC Bilateral Non-Disclosure Agreement.
# Copyright © 2012 EMC Corporation, All Rights Reserved


# Root namespace for ProjectRazor
# @author Nicholas Weaver
module ProjectRazor
  module System

    # Root namespace for Systems defined in ProjectRazor for node hand off
    # @author Nicholas Weaver
    # @abstract
    class Base < ProjectRazor::Object
      attr_accessor :name
      attr_accessor :type
      attr_accessor :servers
      attr_accessor :description
      attr_accessor :user_description
      attr_accessor :hidden

      def initialize(hash)
        super()
        @hidden = true
        @type = :base
        @servers = []
        @description = "Base system type - not used"
        @_collection = :systems
        from_hash(hash) if hash
      end

      # Method call for handing nodes off to System instances
      def system_init_hand_off(options = {})
        # return false because the Base object does nothing
        # Child objects do not need to call super
        false
      end

      # Method call for validating that a System instance successfully received the node
      def validate_system_hand_off(options = {})
        # return false because the Base object does nothing
        # Child objects do not need to call super
        false
      end

      def print_header
        return "Name", "Description", "Type", "Servers", "UUID"
      end

      def print_items
        return @name, @user_description, @type.to_s, "[#{@servers.join(",")}]", @uuid
      end

      def line_color
        :white_on_black
      end

      def header_color
        :red_on_black
      end
    end
  end
end