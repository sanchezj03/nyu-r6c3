desc "Checks your app and gently warns you if you are using deprecated code." 
task :deprecated => :environment do
  deprecated = {
    '@params'    => 'Use params[] instead',
    '@session'   => 'Use session[] instead',
    '@flash'     => 'Use flash[] instead',
    '@request'   => 'Use request[] instead',
    '@env' => 'Use env[] instead',
    'find_all'   => 'Use find(:all) instead',
    'find_first' => 'Use find(:first) instead',
    'render_partial' => 'Use render :partial instead',
    'component'  => 'Use of components are frowned upon',
    'paginate'   => 'The default paginator is slow. Writing your own may be faster',
    'start_form_tag'   => 'Use form_for instead',
    'end_form_tag'   => 'Use form_for instead',
    ':post => true'   => 'Use :method => :post instead'
  }

  deprecated.each do |key, warning|
    puts '--> ' + key
    output = `cd '#{File.expand_path('app', RAILS_ROOT)}' && grep -n --exclude=*.svn* -r '#{key}' *`
    unless output =~ /^$/
      puts "  !! " + warning + " !!" 
      puts '  ' + '.' * (warning.length + 6)
      puts output
    else
      puts "  Clean! Cheers for you!" 
    end
    puts
  end
end

namespace 'views' do
  desc 'Renames all .rhtml views to .html.erb, .rjs to .js.rjs, .rxml to .xml.builder, and .haml to .html.haml'
  task 'rename' do
    Dir.glob('app/views/**/[^_]*.rhtml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rhtml$/, '.html.erb')}`
    end

    Dir.glob('app/views/**/[^_]*.rxml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rxml$/, '.xml.builder')}`
    end

    Dir.glob('app/views/**/[^_]*.rjs').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.rjs$/, '.js.rjs')}`
    end
    Dir.glob('app/views/**/[^_]*.haml').each do |file|
      puts `svn mv #{file} #{file.gsub(/\.haml$/, '.html.haml')}`
    end
  end
end