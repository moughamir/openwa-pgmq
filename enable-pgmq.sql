-- Run once in the Supabase SQL editor for this project.
-- Enables pgmq (Supabase Queues) and creates a queue named
-- "openwa_webhooks" your own consumer (n8n, a worker) can poll.
-- OpenWA itself does not read/write this queue — it still delivers
-- webhooks directly via HTTP. Use this only if you want a durable
-- buffer in front of your own webhook receiver.

create extension if not exists pgmq;

select pgmq.create('openwa_webhooks');

-- Example consumer read (batch of 10, 30s visibility timeout):
-- select * from pgmq.read('openwa_webhooks', 30, 10);
