class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)

    # ARTWORK ROUTES

    # Artwork Index
    if req.path == '/artworks' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Artwork.all.to_json]]
    end
    # Artwork Create
    if req.path == ('/artworks') && req.post?
      body = JSON.parse(req.body.read)
      artwork = Artwork.create(body)
      return [201, {'Content-Type' => 'application/json'}, [artwork.to_json]]
    end
    # Artwork Show
 if req.path.match('/artworks/') && req.get?
      id = req.path.split('/')[2]
      begin
        artwork = Artwork.find(id)
        return [200, {'Content-Type' => 'application/json'}[artwork.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Artwork not found"}.to_json]]
      end
    end
    # Artwork Update
    if req.path.match('/artworks/') && req.put?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        artwork = Artwork.find(id)
        artwork.update(body)
        return [202, {'Content-Type' => 'application/json'}, [artwork.to_json]]
      end
    end
    # Artwork Delete
    if req.path.match('/artworks/') && req.delete?
      id = req.path.split('/')[2]
      begin
        artwork = Artwork.find(id)
        artwork.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Artwork Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Artwork not found"}.to_json]]
      end
    end

    # ARTIST ROUTES

    # Artist Index
    if req.path == '/artists' && req.get?
      return [200, {'Content-Type' => 'application/json'}, [Artist.all.to_json]]
    end
    # Artist Create
    if req.path == ('/artists') && req.post?
      body = JSON.parse(req.body.read)
      artist = Artist.create(body)
      return [201, {'Content-Type' => 'application/json'}, [artist.to_json]]
    end

    # Artist Show

    if req.path.match('/artists/') && req.get?
      id = req.path.split('/')[2]
      begin
        artist = Artist.find(id)
        # the include method allows us to add to the json hash
        return [200, {'Content-Type' => 'application/json'}, [artist.as_json(include: :artworks).to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Artist not found"}.to_json]]
      end
    end
    # Artist Update
    if req.path.match('/artists/') && req.put?
      id = req.path.split('/')[2]
      body = JSON.parse(req.body.read)
      begin
        artist = Artist.find(id)
        artist.update(body)
        return [202, {'Content-Type' => 'application/json'}, [artist.to_json]]
      end
    end
    # Artist Delete
    if req.path.match('/artists/') && req.delete?
      id = req.path.split('/')[2]
      begin
        artist = Artist.find(id)
        artist.destroy
        return [200, {'Content-Type' => 'application/json'}, [{message: "Artist Destroyed"}.to_json]]
      rescue
        return [404, {'Content-Type' => 'application/json'}, [{message: "Artist not found"}.to_json]]
      end
    end


    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]

    else
      res.write "Path Not Found"

    end

    res.finish
  end

end
