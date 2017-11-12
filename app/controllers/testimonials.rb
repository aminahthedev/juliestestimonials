get '/testimonials' do
  @testimonials = Testimonial.all

  erb :'/testimonials/index'
end

get '/testimonials/new' do
  erb :'/testimonials/new'
end

post '/testimonials' do
  @testimonial = Testimonial.new(title: params[:title], content: params[:content], author_id: current_user.id)

  if @testimonial.save
    redirect '/testimonials'
  else
    erb :'/testimonials/new'
  end
end

get '/testimonials/:id' do
  @testimonial = Testimonial.find(params[:testimonial_id])

  erb :'/testimonials/show'
end

put '/testimonials/:id/edit' do
  @testimonial = Testimonial.find(params[:id])

  @testimonial.assign_attribute(params[:testimonial])

  if @testimonial.save
    redirect
  else
    erb :'/testimonials/edit'
  end
end

delete '/testimonials/:id' do
  @testimonial = Testimonial.find(params[:id])

  @testimonial.destroy

  redirect '/testimonials'
end
