class ProjectsController < ApplicationController
    before_action :authorized, :get_user, only: [:create, :new, :show, :projects ,:edit, :update, :get_user, :get_project1, :get_project, :get_user_id, :assigned_projects]
    before_action :get_project1, only: [:show]
    before_action :get_project, only: [:edit, :update]
    before_action :get_user_id, except: [:create, :projects]
      
    def get_user
        @user = User.find(params[:user_id])
    end 
    
    def get_project1
        @project = @user.projects.find(params[:id])
    end    

    def get_project
        @project = Project.find(params[:id])
    end  
    
    def get_user_id
        @user_id = current_user.id
    end 
    
    def create
        @project = @user.projects.build(post_params)
        if @project.save
            ProjectMailer.delay(run_at: 5.minutes.from_now).add_project(user: @user)
            session[:project_id] = @project.id
            redirect_to user_projects_profile_path, success: "Projects is created and a mail is sent"
        else
            redirect_to create_project_path, danger: "Please fill the field properly !!"
        end        
    end

    def show
        session[:project_id] = @project.id
        @feature_current = Feature.filter_by(current_project.id,"Current_itteration")
        @feature_backlog = Feature.filter_by(current_project.id,"Backlog")
        @feature_icebox = Feature.filter_by(current_project.id,"Icebox")
    end
    
    def projects
    end 
    
    def assigned_projects
        list = []
        @user = current_user
        @features = Feature.where(mailId: @user.username) 
        @features.each do |feature|
            @project = Project.find_by(id: feature.project_id)
            list.push(@project)
        end
        @projects = list.uniq
    end    

    def edit
    end    
    
    def update
        if @project.update(post_params)
            redirect_to user_projects_profile_path, success: "Projects is updated"     
        else
            render 'edit', danger: "Please fill the fields properly !!!"
        end        
    end 
    
    def destroy
        @project = Project.find(params[:id])
        @features = Feature.where(project_id: @project.id)
        @features.each do |feature|
            feature.destroy
        end
        @project.destroy
        ProjectMailer.delay(run_at: 5.minutes.from_now).delete_project(user: @user)
        redirect_to user_path(current_user.id), success: "Project is deleted as well as the features if any and a confirmation is also send !!"  
    end    

 
    private 
    def post_params
        params.require(:project).permit(:projectname)
    end   
    
end
