module ListMaker
  class ListDir
    
    @@dirname = 'lm_lists'

    def self.dirname
      @@dirname
    end
    
    attr_reader :files
    
    def initialize
      @dirpath = File.join(APP_ROOT, @@dirname)
      if Dir.exist?(@dirpath)
        # confirm that it is readable
        if !File.readable?(@dirpath)
          abort("List directory exists but is not readable.")
        end

        # confirm that it is writable
        if !File.writable?(@dirpath)
          abort("List directory exists but is not writable.")
        end
      else
        # or create a new directory in APP_ROOT
        #   Use Dir.mkdir
        Dir.mkdir(@dirpath)
        if !Dir.exist?(@dirpath)
          abort("List directory does not exist and could not be created.")
        end
      end

      refresh_cached_files
      
      # if success, return self, otherwise exit program
      self
    end
    
    def choose_list
      # Display list of files with numbers
      puts "\nChoose list file\n\n".upcase
      puts "Select the number of a list file to use."
      list
      puts "* Type 'add' to create a new file."
      # Ask user to choose a number
      print "> "
      response = gets.chomp
      # User can also type 'add' to add a new list
      if response == 'add'
        filename = add
      else
        number = response.to_i
        # Default to first file if user data is invalid
        number = 1 unless (1..@files.length).include?(number)
        filename = @files[number-1]
      end
      puts "Now using: #{filename}"
      # Return filename so it can be loaded by ListFile
      filename
    end
    
    def list
      puts "-" * 60
      @files.each_with_index do |filename, i|
        puts "#{i+1}: #{filename}"
      end
      puts "-" * 60
    end
    
    def add
      # Ask user to provide a new file name and create it
      puts "Enter the filename you would like to use."
      puts "Names should be lowercase with underscores."
      puts "Example: grocery_list.txt"
      print "> "

      # Ensure file name ends in '.txt'
      # Create new file
      # Refresh cached files (or add filename to @files)
      # Return filename so it can be loaded by ListFile

      response = gets.chomp
      name = response.downcase.strip
      # Ensure file name ends in '.txt'
      name << ".txt" unless name.end_with?('.txt')
      filepath = File.join(@dirpath, name)
      File.open(filepath, 'w')
      # Refresh cached files (or add filename to @files)
      refresh_cached_files
      # Return filename so it can be loaded by ListFile
      name
    end
    
    def refresh_cached_files
      # Store the list of the files in this directory in @files
      # Use Dir.entries or Dir.glob
      # Be sure not to include "." files or directories
      # Only return filenames, not absolute or relative paths

      @files = Dir.glob("#{@dirpath}/*.txt")
      @files.reject! {|f| f.start_with?('.') }
      @files.reject! {|f| File.directory?(f)}
      @files.map! {|f| File.basename(f) }
    end
    
  end
end
