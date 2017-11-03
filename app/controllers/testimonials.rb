get '/' do
  erb :'/testimonials/index'
end

get '/testimonials/new' do
  erb :'/testimonials/new'
end

post '/testimonials' do
  @testimonial = Testimonial.new(params[:testimonial])

  if @testimonial.save
    redirect
  else
    erb :'/testimonials/new'
  end
end

get '/testimonials/:id' do
  @testimonial = Testimonial.find(params[:id])

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

  redirect '/'
end
