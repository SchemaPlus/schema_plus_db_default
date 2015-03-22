require 'schema_plus/core'

require_relative 'db_default/version'

# Load any mixins to ActiveRecord modules, such as:
#
#require_relative 'db_default/active_record/base'

# Load any middleware, such as:
#
# require_relative 'db_default/middleware/model'

SchemaMonkey.register SchemaPlus::DbDefault
