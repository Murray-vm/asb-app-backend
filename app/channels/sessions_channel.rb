

#   def subscribed
#     # Assume `params[:student_id]` is sent when the student subscribes
#     student_id = params[:student_id]
    
#     if student_id.present?
#       stream_from "sessions_channel"
      
#       # Store the student ID in Redis or a similar data store
#       REDIS.sadd("session_#{params[:session_id]}_students", student_id)
#     end
#   end

#   def unsubscribed
#     student_id = params[:student_id]
    
#     if student_id.present?
#       # Remove the student ID when they unsubscribe
#       REDIS.srem("session_#{params[:session_id]}_students", student_id)
#     end
#   end
# end

# class SessionsChannel < ApplicationCable::Channel

# def subscribed
#   student_id = params[:student_id]

#   if student_id.present?
#     stream_from "sessions_channel"
#     REDIS.sadd("session_#{params[:session_id]}_students", student_id)
    
#     # Notify the teacher's channel about active students
#     ActionCable.server.broadcast "sessions_channel", {
#       type: "new_student",
#       student_id: student_id,
#       session_id: params[:session_id]
#     }
#   end
# end

# def unsubscribed
#   student_id = params[:student_id]

#   if student_id.present?
#     REDIS.srem("session_#{params[:session_id]}_students", student_id)
    
#     # Notify the teacher about the disconnection
#     ActionCable.server.broadcast "sessions_channel", {
#       type: "student_left",
#       student_id: student_id,
#       session_id: params[:session_id]
#     }
#   end
# end
# # end

# require 'redis'

# class SessionsChannel < ApplicationCable::Channel
#   def subscribed
#     student_id = params[:student_id]
#     if student_id.present?
#       stream_from "sessions_channel"
#       REDIS.sadd("session_#{params[:session_id]}_students", student_id)
#       Rails.logger.info "Student #{student_id} subscribed to session #{params[:session_id]}"
#     end
#   end

#   def unsubscribed
#     student_id = params[:student_id]
#     if student_id.present?
#       REDIS.srem("session_#{params[:session_id]}_students", student_id)
#       Rails.logger.info "Student #{student_id} unsubscribed from session #{params[:session_id]}"
#     end
#   end
# end

# require 'redis'

# class SessionsChannel < ApplicationCable::Channel
#   def subscribed
#     student_id = params[:student_id]
#     if student_id.present?
#       stream_from "sessions_channel"
#       redis = Redis.new(url: ENV['REDIS_URL'])
#       redis.sadd("session_#{params[:session_id]}_students", student_id)
#       Rails.logger.info "Student #{student_id} subscribed to session #{params[:session_id]}"
#     end
#   end

#   def unsubscribed
#     student_id = params[:student_id]
#     if student_id.present?
#       redis = Redis.new(url: ENV['REDIS_URL'])
#       redis.srem("session_#{params[:session_id]}_students", student_id)
#       Rails.logger.info "Student #{student_id} unsubscribed from session #{params[:session_id]}"
#     end
#   end
# end
# 
# class SessionsChannel < ApplicationCable::Channel
#   def subscribed
#     # student_id = params[:student_id]
#     # if student_id.present?
#     #   stream_from "sessions_channel"
#     #   REDIS_CLIENT.sadd("session_#{params[:session_id]}_students", student_id) # Use REDIS_CLIENT here
#     #   Rails.logger.info "Student #{student_id} subscribed to session #{params[:session_id]}"
#     # end
#   end

#   def unsubscribed
#     # student_id = params[:student_id]
#     # if student_id.present?
#     #   REDIS_CLIENT.srem("session_#{params[:session_id]}_students", student_id) # Use REDIS_CLIENT here
#     #   Rails.logger.info "Student #{student_id} unsubscribed from session #{params[:session_id]}"
#     # end
#   end
# end

class SessionsChannel < ApplicationCable::Channel
  def subscribed
    # The client will stream data for the given session_id
    stream_for params[:session_id]
  end

  def unsubscribed
    # Cleanup when the client unsubscribes (if necessary)
  end
end

