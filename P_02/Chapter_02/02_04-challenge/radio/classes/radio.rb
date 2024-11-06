
class Radio
  
  attr_reader :volume
  attr_reader :frequency

  @@fm_frequencies = 88.0..108.0
  @@default_fm_frequency = 95.5

  @@am_frequencies = 540.0..1600.0
  @@default_am_frequency = 1010.0

  @@allowed_volume = 1..10
  @@default_volume = 5

  def self.am
    Radio.new(band: 'AM')
  end

  def self.fm
    Radio.new(band: 'FM')
  end

  def initialize(options={})
    @band = options[:band] || 'FM'
    self.volume = options[:volume] || @@default_volume
    self.frequency = options[:frequency] || @default_frequency
  end

  def frequency=(value)
    value = value.to_f
    value = default_frequency unless allowed_frequencies.include?(value)
    @frequency = value.to_f
  end

  def volume=(value)
    value = value.to_f
    value = @@default_volume unless @@allowed_volume.include?(value)
    @volume = value.to_f
  end

  def crank_it_up
    @volume = 11
  end

  def status
    "station #{@frequency} #{@band}, volume: #{@volume}"
  end

private

  def default_frequency
    @band == 'AM' ? @@default_am_frequency : @@default_fm_frequency
  end

  def allowed_frequencies
    @band == 'AM' ? @@am_frequencies : @@fm_frequencies
  end

end
