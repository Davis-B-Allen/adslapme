class Gallery < ActiveRecord::Base
	def picture= (p)
		@picture = p
	end

	def validate
		errors.add_on_empty 'name'

		#if not (@picture.kind_of? StringIO or @picture.kind_of? Tempfile)
		#	errors.add_to_base("No file selected")
		#	return
		#end
		@new_pic = Tempfile.new("AEGALLERY")
		while not @picture.eof?
			@new_pic.write @picture.read
		end
	end

	def after_save
		@picdest = "#{RAILS_ROOT}/public/images/#{self.name}.jpg"
		#FileUtils.copy(@new_pic, @picdest)
		#FileUtils.chmod 0644, @picdest
		self.url = @picdest
	end

	def after_destroy
		@picdest = "#{RAILS_ROOT}/public/images/#{self.name}.jpg"
		FileUtils.safe_unlink(@picdest)
	end

	def img_tag
		"<img src='#{self.url}' alt='#{self.name}'>"
	end
end
