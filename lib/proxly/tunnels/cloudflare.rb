# frozen_string_literal: true
require "faraday"

module Proxly
  module Tunnels
    class Cloudflare
      def initialize
        @account_id = ENV["CLOUDFLARE_ACCOUNT_ID"]
        @token = ENV["CLOUDFLARE_API_TOKEN"]
        @tunnel_id = ENV["CLOUDFLARE_TUNNEL_ID"]
        @client =
          Faraday.new do |f|
            f.request :json
            f.request :authorization, "Bearer", @token
            f.response :json
          end
      end

      def self.start
        Cloudflare.new.send(:_start)
      end

      def self.stop
        Cloudflare.new.send(:_stop)
      end

      private

      def _start
        puts "Starting cloudflare tunnel"
        ingress = [
          {
            "hostname" => "#{Proxly.host}",
            "service" => "http://localhost:#{Proxly.port}",
          },
          { "service" => "http_status:404" },
        ]
        res =
          @client.put(
            "https://api.cloudflare.com/client/v4/accounts/#{@account_id}/cfd_tunnel/#{@tunnel_id}/configurations",
            "{\"config\": {\"ingress\":#{ingress.to_json}}}",
          )
        puts res.body
      end

      def _stop
        puts "Stopping clouldflare tunnel"
        ingress = [{ "service" => "http_status:404" }]
        res =
          @client.put(
            "https://api.cloudflare.com/client/v4/accounts/#{@account_id}/cfd_tunnel/#{@tunnel_id}/configurations",
            "{\"config\": {\"ingress\":#{ingress.to_json}}}",
          )
        puts res.body
      end
    end
  end
end
