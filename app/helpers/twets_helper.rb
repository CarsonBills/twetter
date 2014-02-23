module TwetsHelper
	def username_link(str)
		str.gsub(/^@(\w+)$/, '<a href="/\1">@\1</a>').html_safe
		# The link should be <a href="/username">username</a>
	end
end
