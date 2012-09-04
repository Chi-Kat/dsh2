module AssetsHelper

	def shorten(youtube_url)
    domain = youtube_url.split('/')[2]
    if domain.include?("youtube")
      query_string = youtube_url.split("?").last
      if query_string
        parameters = query_string.split("&")
        if parameters
          id_param = parameters.select { |parameter| parameter[0..1] == "v=" }.first
          if id_param
            id = id_param.split("=").last
          end
        end
      end
      return id 
    elsif domain.include?("youtu.be")
      id = youtube_url.split('/').last
      return id
    end
  end

end
