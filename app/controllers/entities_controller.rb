class EntitiesController < ApplicationController
  before_action :set_entity, only: %i[show edit update destroy]

  def index
    @page = 'TRANSACTIONS'
    @group = Group.find(params[:group_id])
    @group_entities = EntityGroup.where(group_id: params[:group_id]).order('created_at DESC')
    @entities = []
    @group_entities.each do |entity_group|
      entity = Entity.find(entity_group.entity_id)
      @entities << entity
    end
  end

  def show; end

  def new
    @page = 'NEW TRANSACTION'
    @id = params[:group_id]
    @name = Group.find(params[:group_id]).name
    @entity = Entity.new
    @group = Group.find(params[:group_id])
    @entity = @group.entities.build
  end

  def edit; end

  def create
    @entity = Entity.new(entity_params)
    @entity_group = EntityGroup.new(group: Group.find(params[:group_id]), entity: @entity)

    respond_to do |format|
      if @entity.save && @entity_group.save
        format.html do
          redirect_to "/groups/#{params[:group_id]}/entities", notice: 'Transaction was successfully created.'
        end
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to entity_url(@entity), notice: 'Entity was successfully updated.' }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entity.destroy

    respond_to do |format|
      format.html { redirect_to entities_url, notice: 'Entity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount).merge(author: current_user)
  end
end
