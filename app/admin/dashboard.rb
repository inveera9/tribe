ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
        columns do
            column do
                panel "Admin User Management" do
                    link_to("Admin User Management", admin_admin_users_path)
                end
            end
            column do
                panel "Dashboard" do
                    link_to("Dashboard", admin_dashboard_path)
                end
            end
        end
    end
  end # content
end
