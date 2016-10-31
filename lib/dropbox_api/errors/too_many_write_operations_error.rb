module DropboxApi::Errors
  class TooManyWriteOperations < BasicError
    attr_accessor :retry_after
  end
end
