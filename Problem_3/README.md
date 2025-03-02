
If NGINX is used solely as a traffic router for upstream services, there are two distinct aspects to check:

1. **NGINX configuration.**
2. **The status, processing speed, and response time of the upstream service.**
---
#### - For case 1, I researched and used ChatGPT with some parameters that might be related:
1. **proxy_buffer_size and proxy_buffers**:
   - **Description**: These parameters define the size and number of buffers used to temporarily store data when proxying requests.
   - **Solution**: Reducing the size and number of buffers can help decrease memory usage.

2. **keepalive_requests**:
   - **Description**: This parameter specifies the maximum number of requests that a keep-alive connection can handle before being closed.
   - **Solution**: Setting a reasonable value for `keepalive_requests` to avoid holding connections for too long and consuming memory.

3. **client_max_body_size**:
   - **Description**: This parameter specifies the maximum size of each request that the NGINX server can handle.
   - **Solution**: Reducing the value of `client_max_body_size` to limit the size of requests and decrease memory usage.

4. **http2_max_concurrent_streams**:
   - **Description**: This parameter specifies the maximum number of concurrent streams that an HTTP/2 connection can handle.
   - **Solution**: Reducing the value of `http2_max_concurrent_streams` to avoid excessive memory consumption for concurrent streams.

5. **proxy_cache**:
   - **Description**: Using proxy cache can increase memory usage if not configured properly.
   - **Solution**: Reviewing and adjusting cache-related parameters such as `proxy_cache_path`, `proxy_cache_key`, and `proxy_cache_valid`.

6. **worker_processes and worker_connections**:
   - **Description**: The `worker_processes` parameter defines the number of worker processes, and `worker_connections` defines the maximum number of connections each worker process can handle.
   - **Solution**: Adjusting these parameters to ensure NGINX does not consume too much memory for processes and connections.

7. **upstream keepalive**:
   - **Description**: This parameter specifies the maximum number of keep-alive connections that NGINX can maintain with upstream servers.
   - **Solution**: Reducing the value of `keepalive` in the upstream configuration to limit the number of keep-alive connections and reduce memory usage.
---
#### - Regarding the second issue, based on my personal experience, I would propose a few solutions:

1. The first priority is to identify the underlying cause of the service delay and resolve it.
2. Reduce the connection timeout to avoid impacting all other services sharing this load balancer.
3. Temporarily reduce the number of concurrent connections to this service until the issue can be addressed.