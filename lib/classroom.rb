class Classroom

  def self.create(teacher_id, name)
    conn = connect

    response = conn.post do |req|
      req.url "/teachers/#{teacher_id}/classrooms"
      req.headers['Content-Type'] = 'application/json'
      req.body = {name: "#{name}", teacher_id: "#{teacher_id}"}.to_json
    end
    classroom = objectify(response)
  end

  private

  def self.connect
    Faraday.new(:url => 'http://localhost:3000') do |faraday|
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def self.objectify response
    data = JSON.parse(response.body)
    OpenStruct.new(
                   :name => data["name"],
                   :teacher_id => data["teacher_id"],
                   :id => data["id"]
                  )
  end
end