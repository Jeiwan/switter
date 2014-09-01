class Cropper < Paperclip::Processor
	def initialize file, options = {}, attachment = nil
		super
		@format = File.extname(@file.path)
		@basename = File.basename(@file.path, @format)
	end

	def make
		source = @file
		dest = Tempfile.new([@basename, '.jpg'])
		target = @attachment.instance

		Paperclip.run("convert", "#{File.expand_path(source.path)} -crop #{target.crop_w}x#{target.crop_h}+#{target.crop_x}+#{target.crop_y} #{File.expand_path(dest.path)}")

		dest
	end
end
