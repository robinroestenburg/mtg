class LineFilter < SimpleCov::Filter
  def passes?(source_file)
    source_file.lines.count < filter_argument
  end
end

SimpleCov.start 'rails' do
  add_group "Short files", LineFilter.new(5)
end
