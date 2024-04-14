class_name SkillSlot
extends Draggable

var skill_ref: Skill

func init(skill: Skill) -> void:
	skill_ref = skill
	color = skill.color
	name = skill.name
	($Label as Label).text = skill.name
