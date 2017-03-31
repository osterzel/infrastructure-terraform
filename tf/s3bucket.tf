resource "aws_s3_bucket" "hosting-s3bucket" {
	bucket = "${var.owner}-hosting-bucket-${var.environment}"

        tags {
                Name = "${var.vpc_name}"
                Owner = "${var.owner}"
                Project = "${var.project}"
                Environment = "${var.environment}"
                BuiltBy = "terraform"
        }

}
