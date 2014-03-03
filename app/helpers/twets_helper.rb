module TwetsHelper
	def username_link(str)
		str.gsub(/^@(\w+)$/, '<a href="/\1">@\1</a>').html_safe
		# The link should be <a href="/username">username</a>
	end

	def can_retwet(twet)
		if twet.user_id == current_user.id
			return false
		elsif has_retweted(twet)
			return false
		else
			return true
		end
	end


	def has_retweted(twet)
		if retwet(twet).present?
			return true
		else
			return false
		end
	end

	def retwet(twet)
		current_user.retwets.where(:twet_id => twet.id).first
	end
end