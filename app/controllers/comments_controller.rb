class CommentsController < ApplicationController
   def create
      comment = Comment.new(
         user_id: params[:user_id],
         new_id: params[:new_id],
         content: params[:content])

      if comment.save
         render json: comment
      else
         render json: {error: 'Unable to create comment.'}, status: 400
      end

   end
end
