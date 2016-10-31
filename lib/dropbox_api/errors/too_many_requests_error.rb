module DropboxApi::Errors
  class TooManyRequestsError < BasicError
    attr_accessor :retry_after

    ErrorSubtypes = {
      :too_many_requests => TooManyRequestsError,
      :too_many_write_operations => TooManyWriteOperations
    }
  end
end
