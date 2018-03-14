[![License](https://img.shields.io/github/license/plus3it/terraform-external-s3-keys.svg)](LICENSE)
[![Travis CI Build Status](https://travis-ci.org/plus3it/terraform-external-s3-keys.svg?branch=master)](https://travis-ci.org/plus3it/terraform-external-s3-keys)

# terraform-external-s3-keys
Terraform module that returns a list of object keys from an S3 bucket.

## Usage

```
module "bucket_keys" {
  source = "git::https://github.com/plus3it/terraform-external-s3-keys"

  bucket    = "bucket-example"
  prefix    = "s3key/prefix/"
  delimiter = ","
}
```

## Examples

*   [Basic Example][example1]

[example1]: https://github.com/plus3it/terraform-external-s3-keys/tree/master/examples/example1

## Requirements

This module uses an `external` data resource based on a custom python script
to list the objects in the s3 bucket, [`list_s3_keys.py`](list_s3_keys.py). You
must have python installed and in the PATH to use this Terraform module. The
script also requires the packages in the [`requirements.txt`](requirements.txt)
file. Install them using `pip`:

```
pip install -r requirements.txt
```

## Limitations

This module will resolve the AWS credential based on the
[`boto3` credential resolution order][boto3-credential]. However, only the ENV,
config file, and instance role mechanisms are supported by this module (i.e.
cannot pass access/secret/session keys through the module).

This module **will not** use any credential explicitly specified in a Terraform
`aws` provider, as the `external` data resource is not (understandably)
integrated with the `aws` provider.

[boto3-credential]: http://boto3.readthedocs.io/en/latest/guide/configuration.html#configuring-credentials

## Authors

This module is managed by [Plus3IT Systems](https://github.com/plus3it).

## License

Apache 2 licensed. See [LICENSE](LICENSE.md) for details.
