module Zetto::Storage::ImpuretyData

  class Restore

    def execute(token_data_str)
      begin
        token_data_hash = JSON.parse(token_data_str)
        key_of_impurity_hash = token_data_hash.keys[0]
        redis = Zetto::Storage::Connect::RedisSingelton.get
        json_data = redis.get('impurity_hash_data:' + key_of_impurity_hash.to_s)
        return nil if json_data.nil?
        data = JSON.parse(json_data)
        data['token'] = token_data_hash[key_of_impurity_hash]
        data
      rescue Exception => e
        puts e.message
        puts 'An error occurred Zetto::Storage::ImpuretyData::Restore'
        nil
      end
    end

  end

end