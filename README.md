# Rackconnect

[RackConnect](http://www.rackspace.com/cloud/hybrid/rackconnect) provides an isolated path for network traffic to traverse between your [Rackspace](http://rackspace.com)-based cloud and dedicated environments located within the same region. To accomplish this, RackConnect relies on Rackspace Cloud Networks on the cloud side and dedicated network devices on the dedicated side of your environment.

Rackspace is introducing RackConnect v3.0, the latest release of our innovative hybrid connectivity offering that enables you to select and combine the best features of our dedicated and cloud hosting offerings into one all-encompassing solution. With version 3.0, you can design your computing environment to take advantage of the latest benefits in cloud computing—flexibility, scalability, elasticity—along with the benefits of traditional dedicated hosting—enhanced security and performance characteristics. RackConnect is compatible with our dedicated Managed and Intensive service levels and our cloud Managed Operations and Managed Infrastructure service levels, giving you the ability to select the level of Fanatical Support® that you need to properly manage your hybrid environment.

### Basic Usage
Rackconnect follows an ActiveModel-esque pattern that most rubyists will feel familiar with:

``` ruby
	Rackconnect::Auth.new({
		api_key: "",
		username: ""
	})

	# Get an array of your CloudNetworks
	networks = Rackconnect::CloudNetwork.all

	network = Rackconnect::CloudNetwork.find(UUID)

	new_net = Rackconnect::CloudNetwork.create{...})

	new_net.destroy
```

### Models
* [CloudNetwork](http://docs.rcv3.apiary.io/#cloudnetworks)
* [LoadBalancerPool](http://docs.rcv3.apiary.io/#loadbalancerpools)
* [LoadBalancerPoolNode](http://docs.rcv3.apiary.io/#loadbalancerpools)
* [LoadBalancerPoolNodeDetails](http://docs.rcv3.apiary.io/#loadbalancerpools)
* [Public IP](http://docs.rcv3.apiary.io/#publicips)
* [ServerGroup](http://docs.rcv3.apiary.io/#servergroupscomingsoon)
* [ServerGroupNode](http://docs.rcv3.apiary.io/#servergroupscomingsoon)
* [ServerGroupNodeDetails](http://docs.rcv3.apiary.io/#servergroupscomingsoon)

### Testing
* To use the built-in mock server (recommended for normal development). This testing method alleviates the need to contact RackConnect's API but does create a potential break between mock and service.

    * `rake mock:server` and a Sinatra app will start. This app will accept only URIs supported by RackConnect. Each successful response is a JSON blob that is documented as the appropriate response.

    * Open a new tab and run `rake mock:spec` to run the test suite. This method is a wrapper to RSpec and it knows to use the mock server.

* A method to test against RackConnect its self is under active development.

### Notes
* Rackconnect will only work with the RackConnect v3 API (current)

### Tech Info
* [Main Docs](http://www.rackspace.com/knowledge_center/getting-started/rackconnect)
* [API Docs](http://docs.rcv3.apiary.io/)
* [FAQ](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-faq)
* [Limitations](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-limitations)
* [Requirements](http://www.rackspace.com/knowledge_center/article/rackconnect-v30-requirements)
* [Support](http://www.rackspace.com/knowledge_center/article/getting-rackconnect-support)

