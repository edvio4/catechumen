class CreateCurriculumFormOptions

  def initialize(student)
    @student = student
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
    subjects_joins = Subject.joins(:resources).joins('LEFT JOIN "curriculums" ON "curriculums"."resource_id" = "resources"."id"')
    subjects_joins.where(
    subjects_joins.where(curriculums: { resource: nil })
    .where.not(curriculums: { student: @student })
    .where_values.reduce(:or)
    )
    .group('subjects.id').order(:name)
  end

  def get_resources(subject)
    resources_joins = Resource.where(subject: subject).joins('LEFT JOIN "curriculums" ON "curriculums"."resource_id" = "resources"."id"')
    group_resources = resources_joins.where(
        resources_joins.where(curriculums: { resource: nil })
        .where.not(curriculums: { student: @student })
        .where_values.reduce(:or)
      )
      .order(:title)
  end
end
