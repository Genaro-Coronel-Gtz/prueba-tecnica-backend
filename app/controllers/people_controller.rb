class PeopleController < ApplicationController
  before_action :authorized
  before_action :set_person, only: [:show, :update, :destroy]

  # GET /people
  def index
    user = logged_in_user

    people = user.person

    render json: people
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    person = { user: logged_in_user, 
               name: person_params['name'], 
               work_description: person_params['work_description'] 
              }

              @person = Person.new(person)

    if @person.save
      create_log
      Rails.logger.info 'Persona creada correctamente'
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      create_log
      render json: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  def destroy
    if @person.destroy
      create_log
      render json: {message: 'Persona eliminada correctamente'}, status: 200
    else
      render json: { message: 'Error al elimianr persona!'}, status: 400
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :work_description)
    end

    def retrieve_action
      method = request.method
      action = ''
      case method
      when 'POST'
        action = 'Crear'
      when 'PUT'
        action = 'Actualizar'
      when 'DELETE'
        action = 'Eliminar'
      else
        action = 'No especificada'
      end
      action
    end

    # Create log
    def create_log
      begin
        action = retrieve_action
        remote_ip = request.remote_ip # request.env['HTTP_X_FORWARDED_FOR']
        uagent = UserAgent.parse(request.env['HTTP_USER_AGENT'])
        browser = uagent.browser.present? ? uagent.browser : 'No identificado'
        log = {
          user: logged_in_user,
          action: action,
          ip: remote_ip,
          navigator: browser,
          person_name: @person.name
        }
        Log.create(log)
      rescue => e
        binding.pry
        Rails.logger.info 'Error al crear persona Log de persona'
      end
    end
end
