resource "aws_instance" "core-web-node" {
	ami = "${var.core_ami}"
	instance_type = "t2.micro"
	subnet_id = "${aws_subnet.az1.id}"

        tags {
                Name = "${var.vpc_name}"
                Owner = "${var.owner}"
                Project = "${var.project}"
                Environment = "${var.environment}"
                BuiltBy = "terraform"
        }		
}
