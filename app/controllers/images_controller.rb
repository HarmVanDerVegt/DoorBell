class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  after_action :auto_reject, only: :create

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    path = Rails.root.join('public', 'weerhuis.jpg')
    print path
    #content = File.open(path)
    #print content

    @image = Image.new

    @image.image.attach(io: File.open(path), filename: "weerhuis.jpg")

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    @image = Image.find(params[:id])
    @image.finished = true
    @image.save
    `python green.py`
    redirect_to images_path
  end

  def reject
    @image = Image.find(params[:id])
    @image.finished = false
    @image.save
    `python red.py`
    redirect_to images_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:content)
    end

    def auto_reject
      timer = 0

    end
end
