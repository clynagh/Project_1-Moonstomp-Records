require('pg')

class SqlRunner

  def self.run(sql, values)
    db = PG.connect({dbname: 'moonstomp_db', host: 'localhost'})
    db.prepare('statement', sql)
    return db.exec_prepared('statement', values)
    db.close
  end








end