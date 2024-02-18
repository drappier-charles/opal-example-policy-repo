package app.main

default allow = false

acls := [acl | 
  acl := data.acls[_];
  acl.tenant == input.tenant
  acl.sub == input.sub
  action_allowed(acl.action)
  resource_allowed(acl.resource)
]

action_allowed(action) {
  action == input.action
}

action_allowed(action) {
  action == "*"
}

resource_allowed(resource) {
  resource == input.resource
}

resource_allowed(resource) {
  resource == "*"
}

allow {
	count(acls) > 0
}
