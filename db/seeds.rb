# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Only allow these mime_types
dicom_type = MimeType.create(name: 'application/dicom', description: 'Digital Imaging and Communications in Medicine')
png_type   = MimeType.create(name: 'image/png',         description: 'PNG image')
txt_type   = MimeType.create(name: 'text/plain',        description: 'Plain text file')
log_type   = MimeType.create(name: 'text/x-log',        description: 'Log text file')

# Only allow these value_types
string_type        = ValueType.create(name: 'string',        description: 'Basic string value')
integer_type       = ValueType.create(name: 'integer',       description: 'Basic integer value')
float_type         = ValueType.create(name: 'float',         description: 'Basic float value')
string_array_type  = ValueType.create(name: 'string_array',  description: 'Array of string values')
integer_array_type = ValueType.create(name: 'integer_array', description: 'Array of integer values')
float_array_type   = ValueType.create(name: 'float_array',   description: 'Array of float values')

# Default DICOM tags for MR profiling
string_equals        = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'x = "{{value}}"',            value_type: string_type)
string_contains      = ValueTypeMatcher.create(label: 'CONTAINS',   matcher: 'CONTAINS(x, "{{value}}")',   value_type: string_type)
string_begins_with   = ValueTypeMatcher.create(label: 'BEGINSWITH', matcher: 'BEGINSWITH(x, "{{value}}")', value_type: string_type)
string_ends_with     = ValueTypeMatcher.create(label: 'ENDSWITH',   matcher: 'ENDSWITH(x, "{{value}}")',   value_type: string_type)
string_regex         = ValueTypeMatcher.create(label: 'REGEX',      matcher: 'REGEX(x, "{{value}}")',      value_type: string_type)
integer_equals       = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'x = {{value}}',              value_type: integer_type)
integer_range        = ValueTypeMatcher.create(label: 'RANGE',      matcher: 'RANGE(x, {{value}})',        value_type: integer_type)
float_equals         = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'x = {{value}}',              value_type: float_type)
float_epsilon        = ValueTypeMatcher.create(label: 'EPSILON',    matcher: 'EPSILON(x, {{value}})',      value_type: float_type)
float_range          = ValueTypeMatcher.create(label: 'RANGE',      matcher: 'RANGE(x, {{value}})',        value_type: float_type)
string_array_equals  = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'ARRAYEQUALS(x, {{value}})',  value_type: string_array_type)
integer_array_equals = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'ARRAYEQUALS(x, {{value}})',  value_type: integer_array_type)
float_array_equals   = ValueTypeMatcher.create(label: 'EQUALS',     matcher: 'ARRAYEQUALS(x, {{value}})',  value_type: float_array_type)

scan_header_tags = ScanHeaderTag.create([
  { mime_type: dicom_type, key: '0018,0020', value_type: string_type,        label: 'Scanning Sequence',                 },
  { mime_type: dicom_type, key: '0018,0022', value_type: string_type,        label: 'Scan Options',                      },
  { mime_type: dicom_type, key: '0018,0021', value_type: string_type,        label: 'Sequence Variant',                  },
  { mime_type: dicom_type, key: '0018,1310', value_type: integer_array_type, label: 'Acquisition Matrix',                },
  { mime_type: dicom_type, key: '0018,0023', value_type: string_type,        label: 'MR Acquisition Type',               },
  { mime_type: dicom_type, key: '0018,0050', value_type: float_type,         label: 'Slice Thickness',                   },
  { mime_type: dicom_type, key: '0018,0080', value_type: float_type,         label: 'Repetition Time',                   },
  { mime_type: dicom_type, key: '0018,0081', value_type: float_type,         label: 'Echo Time',                         },
  { mime_type: dicom_type, key: '0018,0082', value_type: float_type,         label: 'Inversion Time',                    },
  { mime_type: dicom_type, key: '0018,0083', value_type: integer_type,       label: 'Number of Averages',                },
  { mime_type: dicom_type, key: '0018,0086', value_type: integer_type,       label: 'Echo Number',                       },
  { mime_type: dicom_type, key: '0018,0087', value_type: float_type,         label: 'Magnetic Field Strength',           },
  { mime_type: dicom_type, key: '0018,0088', value_type: float_type,         label: 'Spacing Between Slices',            },
  { mime_type: dicom_type, key: '0018,0091', value_type: integer_type,       label: 'Echo Train Length',                 },
  { mime_type: dicom_type, key: '0018,0093', value_type: integer_type,       label: 'Percent Sampling',                  },
  { mime_type: dicom_type, key: '0018,0094', value_type: integer_type,       label: 'Percent Phase Field of View',       },
  { mime_type: dicom_type, key: '0018,0095', value_type: float_type,         label: 'Pixel Bandwidth',                   },
  { mime_type: dicom_type, key: '0018,1312', value_type: string_type,        label: 'In Plane Phase Encoding Direction', },
  { mime_type: dicom_type, key: '0018,1314', value_type: float_type,         label: 'Flip Angle',                        },
  { mime_type: dicom_type, key: '1108,5100', value_type: string_type,        label: 'Patient Position',                  },
  { mime_type: dicom_type, key: '0028,0010', value_type: integer_type,       label: 'Rows',                              },
  { mime_type: dicom_type, key: '0028,0011', value_type: integer_type,       label: 'Columns',                           },
  { mime_type: dicom_type, key: '0028,0030', value_type: float_array_type,   label: 'Pixel Spacing',                     },
  { mime_type: dicom_type, key: '0008,0060', value_type: string_type,        label: 'Modality',                          },
  { mime_type: dicom_type, key: '0018,0060', value_type: string_type,        label: 'kvP',                               },
  { mime_type: dicom_type, key: '0018,0090', value_type: float_type,         label: 'Data Collection Diameter',          },
  { mime_type: dicom_type, key: '0018,1100', value_type: float_type,         label: 'Reconstruction Diameter',           },
  { mime_type: dicom_type, key: '0018,1110', value_type: float_type,         label: 'Distance Source to Detector',       },
  { mime_type: dicom_type, key: '0018,1111', value_type: float_type,         label: 'Distance Source to Patient',        },
  { mime_type: dicom_type, key: '0018,1120', value_type: float_type,         label: 'Gantry/Detector Tilt',              },
  { mime_type: dicom_type, key: '0018,1140', value_type: string_type,        label: 'Rotation Direction',                },
  { mime_type: dicom_type, key: '0018,1150', value_type: integer_type,       label: 'Exposure time (ms)',                },
  { mime_type: dicom_type, key: '0018,1151', value_type: integer_type,       label: 'X-ray tube current (mA)',           },
  { mime_type: dicom_type, key: '0018,1152', value_type: integer_type,       label: 'Exposure',                          },
  { mime_type: dicom_type, key: '0018,1153', value_type: integer_type,       label: 'Exposure time in micro-A-s',        },
  { mime_type: dicom_type, key: '0018,1160', value_type: string_type,        label: 'Filter Type',                       },
  { mime_type: dicom_type, key: '0018,1170', value_type: integer_type,       label: 'Generator Power',                   },
  { mime_type: dicom_type, key: '0018,1190', value_type: integer_array_type, label: 'Focal Spot(s)',                     },
  { mime_type: dicom_type, key: '0018,1210', value_type: string_type,        label: 'Convolution Kernel',                },
])

# Fetch modality tag for DICOM
dicom_modality_tag        = ScanHeaderTag.find_by(key: '0008,0060')
dicom_slice_thickness_tag = ScanHeaderTag.find_by(key: '0018,0050')

# Set up a test account for MR DICOM inspections
account     = Account.create(name: 'Test Account')
user        = User.create(email: 'user@example.com', password: 'password', account: account)
site        = Site.create(name: 'Test Site', account: account)
equipment   = Equipment.create(name: 'My MR Machine', site: site)
inspection  = Inspection.create(performed_at: Date.today.to_s(:db), equipment: equipment)
mr_protocol = ScanProtocol.create(name: 'ST ~= 1.5', site: site)

mr_modality_matcher = ScanProtocolMatcher.create(
  scan_protocol: mr_protocol,
  scan_header_tag: dicom_modality_tag,
  value_type_matcher: string_equals,
  value: 'MR'
)
mr_slice_thickness_matcher = ScanProtocolMatcher.create(
  scan_protocol: mr_protocol,
  scan_header_tag: dicom_slice_thickness_tag,
  value_type_matcher: float_range,
  value: '1.1, 2.2'
)
