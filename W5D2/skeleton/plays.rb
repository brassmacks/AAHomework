require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end
  
  def Play::find_by_title(title)
      PlayDBConnection.instance.execute("SELECT * FROM plays WHERE title = #{title}")
  end
  
  def Play::find_by_playwright(name)
      PlayDBConnection.instance.execute("SELECT * FROM plays WHERE playwright = #{name}")
  end
  


  def initialize(options)
    # options is a hash, id title year playwright_id are all
    # columns from the data  
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES

        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwright
    attr_accessor :id, :name, :born

    def self.all 
        data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum) }
    end

    def Playwright::find_by_name(name)
        PlayDBConnection.instance.execute(<<-SQL, name)
          SELECT
            *
           FROM
              playwrights
            WHERE
              name = ?
          SQL
          return nil unless person.length > 0 # person is stored in an array! 
          Playwright.new(person.first)
    end

    def initialize(options)
    # options is a hash, id title year playwright_id are all
    # columns from the data  
        @id = options['id']
        @mame= options['name']
        @born = options['born']
    end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL,self.name, self.born)
      INSERT INTO
        playwrights (name, born)
      VALUES
      
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.born, self.id)
      UPDATE
        playwrights
      SET
        name = ?, born = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless self.id
    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
    SELECT
      *
    FROM
      plays
    WHERE 
      playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end
  
end