class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: "ramaj", password: "ramaj"
end
