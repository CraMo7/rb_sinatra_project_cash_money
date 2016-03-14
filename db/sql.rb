require("pg")

class Sql

  def self.run(query)

    begin
      db = PG.connect({dbname: "cash_money", host: "localhost"})
      sql_return = db.exec(query)
      return sql_return

    ensure
      db.close()
    end
    
  end

end