class Image < ApplicationRecord
  has_one_attached :image
  after_create :auto_reject

  def self.create(img)
    image = Image.new
    image.image.attach(io: File.open(img), filename: File.basename(img))
    image.save
  end

  def auto_reject
    if self.finished.nil?
      self.finished = false
      `python red.py`
      self.save
    end
  end
  handle_asynchronously :auto_reject, run_at: Proc.new { 1.minute.from_now }
end
