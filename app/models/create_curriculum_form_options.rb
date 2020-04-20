class CreateCurriculumFormOptions

  def initialize(student, resources)
    @student = student
    @resources = resources
    @grouped_options = []
  end

  def create_grouped_options
    fill_grouped_options
    @grouped_options
  end

  private

  def fill_grouped_options
    subjects = get_subjects
    subjects.each do |subject|
      form_group = []
      form_group << subject.name
      group_resources = get_resources(subject)
      form_group_resources = []
      group_resources.each do |group_resource|
        form_group_resources << [group_resource.title, group_resource.id]
      end
      form_group << form_group_resources
      @grouped_options << form_group
    end
  end

  def get_subjects
    subjects = []
    @resources.each do |resource|
      subjects << resource.subject
    end
    subjects.uniq!
    subjects.sort_by { |x| x.name }
  end

  def get_resources(subject)
    @resources.select { |a| a.subject == subject }.sort_by { |a| a.title }
  end
end
