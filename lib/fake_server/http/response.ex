defmodule FakeServer.HTTP.Response do
  @moduledoc """
  Response structure

  FakeServer makes use of the FakeServer.HTTP.Response structure to define the responses that will be given by the server.

  The structure has the following fields:

    - `:code`: The status code of the response. It must be an integer.
    - `:body`: Optional. The response body. Can be a string or a map.
    - `:headers`: Optional. The response headers. Must be a map with the string keys.

  You can use the `new/3` function to create a new struct.
  """

  @enforce_keys [:code]
  defstruct [code: nil, body: "", headers: %{}]

  @doc """
  Creates a new Response structure.

  ## Example
  ```elixir
  FakeServer.HTTP.Response.new(200, %{name: "Test User", email: "test_user@test.com"}, %{"Content-Type" => "application/json"})
  FakeServer.HTTP.Response.new(200, ~s<{"name":"Test User","email":"test_user@test.com"}>, %{"Content-Type" => "application/json"})
  FakeServer.HTTP.Response.new(201, ~s<{"name":"Test User","email":"test_user@test.com"}>)
  FakeServer.HTTP.Response.new(404)
  ```
  """
  def new(status, body \\ "", headers \\ %{}), do: %__MODULE__{code: status, body: body, headers: headers}

  # 2xx
  def ok(body \\ "", headers \\ %{}), do: new(200, body, headers)
  def created(body \\ "", headers \\ %{}), do: new(201, body, headers)
  def accepted(body \\ "", headers \\ %{}), do: new(202, body, headers)
  def non_authoritative_information(body \\ "", headers \\ %{}), do: new(203, body, headers)
  def no_content(body \\ "", headers \\ %{}), do: new(204, body, headers)
  def reset_content(body \\ "", headers \\ %{}), do: new(205, body, headers)
  def partial_content(body \\ "", headers \\ %{}), do: new(206, body, headers)
  def multi_status(body \\ "", headers \\ %{}), do: new(207, body, headers)
  def already_reported(body \\ "", headers \\ %{}), do: new(208, body, headers)
  def im_used(body \\ "", headers \\ %{}), do: new(226, body, headers)

  @doc """
    Returns a list with all 4xx HTTP methods available
  """
  def all_4xx do
    [
      bad_request(),
      unauthorized(),
      payment_required(),
      forbidden(),
      not_found(),
      method_not_allowed(),
      not_acceptable(),
      proxy_authentication_required(),
      request_timeout(),
      conflict(),
      gone(),
      length_required(),
      precondition_failed(),
      payload_too_large(),
      uri_too_long(),
      unsupported_media_type(),
      expectation_failed(),
      im_a_teapot(),
      misdirected_request(),
      unprocessable_entity(),
      locked(),
      failed_dependency(),
      upgrade_required(),
      precondition_required(),
      too_many_requests(),
      request_header_fields_too_large(),
      unavailable_for_legal_reasons()
    ]
  end

  # 4xx
  def bad_request(body \\ "", headers \\ %{}), do: new(400, body, headers)
  def unauthorized(body \\ "", headers \\ %{}), do: new(401, body, headers)
  def payment_required(body \\ "", headers \\ %{}), do: new(402, body, headers)
  def forbidden(body \\ "", headers \\ %{}), do: new(403, body, headers)
  def not_found(body \\ "", headers \\ %{}), do: new(404, body, headers)
  def method_not_allowed(body \\ "", headers \\ %{}), do: new(405, body, headers)
  def not_acceptable(body \\ "", headers \\ %{}), do: new(406, body, headers)
  def proxy_authentication_required(body \\ "", headers \\ %{}), do: new(407, body, headers)
  def request_timeout(body \\ "", headers \\ %{}), do: new(408, body, headers)
  def conflict(body \\ "", headers \\ %{}), do: new(409, body, headers)
  def gone(body \\ "", headers \\ %{}), do: new(410, body, headers)
  def length_required(body \\ "", headers \\ %{}), do: new(411, body, headers)
  def precondition_failed(body \\ "", headers \\ %{}), do: new(412, body, headers)
  def payload_too_large(body \\ "", headers \\ %{}), do: new(413, body, headers)
  def uri_too_long(body \\ "", headers \\ %{}), do: new(414, body, headers)
  def unsupported_media_type(body \\ "", headers \\ %{}), do: new(415, body, headers)
  def expectation_failed(body \\ "", headers \\ %{}), do: new(417, body, headers)
  def im_a_teapot(body \\ "", headers \\ %{}), do: new(418, body, headers)
  def misdirected_request(body \\ "", headers \\ %{}), do: new(421, body, headers)
  def unprocessable_entity(body \\ "", headers \\ %{}), do: new(422, body, headers)
  def locked(body \\ "", headers \\ %{}), do: new(423, body, headers)
  def failed_dependency(body \\ "", headers \\ %{}), do: new(424, body, headers)
  def upgrade_required(body \\ "", headers \\ %{}), do: new(426, body, headers)
  def precondition_required(body \\ "", headers \\ %{}), do: new(428, body, headers)
  def too_many_requests(body \\ "", headers \\ %{}), do: new(429, body, headers)
  def request_header_fields_too_large(body \\ "", headers \\ %{}), do: new(431, body, headers)
  def unavailable_for_legal_reasons(body \\ "", headers \\ %{}), do: new(451, body, headers)


  @doc """
    Returns a list with all 4xx HTTP methods available
  """
  def all_5xx do
    [
      internal_server_error(),
      not_implemented(),
      bad_gateway(),
      service_unavailable(),
      gateway_timeout(),
      http_version_not_supported(),
      variant_also_negotiates(),
      insufficient_storage(),
      loop_detected(),
      not_extended(),
      network_authentication_required()
    ]
  end

  # 5xx
  def internal_server_error(body \\ "", headers \\ %{}), do: new(500, body, headers)
  def not_implemented(body \\ "", headers \\ %{}), do: new(501, body, headers)
  def bad_gateway(body \\ "", headers \\ %{}), do: new(502, body, headers)
  def service_unavailable(body \\ "", headers \\ %{}), do: new(503, body, headers)
  def gateway_timeout(body \\ "", headers \\ %{}), do: new(504, body, headers)
  def http_version_not_supported(body \\ "", headers \\ %{}), do: new(505, body, headers)
  def variant_also_negotiates(body \\ "", headers \\ %{}), do: new(506, body, headers)
  def insufficient_storage(body \\ "", headers \\ %{}), do: new(507, body, headers)
  def loop_detected(body \\ "", headers \\ %{}), do: new(508, body, headers)
  def not_extended(body \\ "", headers \\ %{}), do: new(510, body, headers)
  def network_authentication_required(body \\ "", headers \\ %{}), do: new(511, body, headers)

  def default, do: new(200, ~s<{"message": "This is a default response from FakeServer"}>)
end


