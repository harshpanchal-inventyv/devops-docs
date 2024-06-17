#~ Basics
# To enable istio add a label to namespace as : [istio-injection: enabled]

#~ Conclusions of peer-authentication
# Lets understand with few scenerio's, there are 4 namespaces - default, frontend, backend, database
# pa refers to peer-authentication file
# ns refers to namespace
# Here default ns is not a part of istio service mesh

#& Scenerio-1 
# namespace      istio-enabled      pa      curl to pod from default      curl to service from default

# frontend       true               false   yes                           yes
# backend        true               false   yes                           yes
# database       true               false   yes                           yes

# frontend       true               true    no                            no                                 
# backend        true               true    no                            no
# database       true               true    no                            no

#& Scenerio-2 
# Between this namespaces one pod inside a namespace can access another's ns service only not the pods

# namespace      istio-enabled      pa      communication through pod's between this three ns      communication through service between this three ns       

# frontend       true               true    no                                                     yes
# backend        true               true    no                                                     yes
# database       true               true    no                                                     yes

#& Scenerio-3
# If you want to stop service communication between ns then apply the network policy

# kind: NetworkPolicy
# metadata:
#   name: test-network-policy
#   namespace: database
# spec:
#   policyTypes:
#   - Ingress
#   ingress:
# Only below resources can access to namespace above given
#   - from:
#     - namespaceSelector:
#         matchLabels:
#           ns: backend


#& Scenerio-4

# There is also a concept of authorization after implementing peer authentication

#? This is a default deny like network policy for authorization consider as best practice 

# apiVersion: security.istio.io/v1beta1
# kind: AuthorizationPolicy
# metadata:
#   name: allow-nothing
#   namespace: database
# spec:
#   {}

---

#? This will allow only backend to communicate with database

# apiVersion: security.istio.io/v1beta1
# kind: AuthorizationPolicy
# metadata:
#   name: allow-only-backend
#   namespace: database
# spec:
#   action: ALLOW
#   rules:
#   - from:
#     - source:
#         namespaces: ["backend"]
#     to:
#     - operation:
#         methods: ["GET"]



#~ Another fetaures for istio
# 1) fault injection - It will make the service faulty for some traffic in weighted manner (It also include abort feature to avoid all traffic)
# 2) timeout - It will show the service unavailable if the service takes more time to response then mentioned
# 3) circuitbreaker - It impose restrictions on connection level or define rules for http1connection or tcpconnection  
# 4) Use subset or destination rule to control the traffic on services also to distribute load according to weight
# 5) retries: If service not responds then it tries again to connect


