require 'json'

class Flash

    attr_reader :now

    def initialize(req)
        cookie = req.cookies['_rails_lite_app_flash']
        prev_flash = JSON.parse(cookie) unless cookie.nil?
        @now = prev_flash ? prev_flash : {}
        @flash = {}
    end

    def [](key)
        @now[key.to_s] || @flash[key.to_s] 
    end
    
    def []=(key, val)
        @flash[key.to_s] = val
    end
    
      # serialize the hash into json and save in a cookie
      # add to the responses cookies
      def store_flash(res)
        cookie = @flash.to_json
        res.set_cookie('_rails_lite_app_flash', path: '/', value: cookie)
      end

end
