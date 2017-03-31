resource "aws_vpc" "default" {
	cidr_block = "${var.vpc_cidr}"
	tags {
		Name = "${var.vpc_name}"
		Owner = "${var.owner}"
		Project = "${var.project}"
		Environment = "${var.environment}"
		BuiltBy = "terraform"
	}
}

resource "aws_subnet" "az1" {
	vpc_id = "${aws_vpc.default.id}"
	cidr_block = "${var.vpc_cidr_az1}" 
	tags {
		Name = "${var.vpc_name}"
		Owner = "${var.owner}"
		Project = "${var.project}"
		Environment = "${var.environment}"
		BuiltBy = "terraform"
	}
}
