module FinalAPI
  module V1
    module Http
      class Job
        include ::Travis::Api::Formats

        attr_reader :job, :commit

        def initialize(job, options = {})
          @job = job
          @commit = job.commit
        end

        def data
          {
            'id' => job.id,
            'number' => job.number,
            'config' => job.obfuscated_config.stringify_keys,
            'repository_id' => job.repository_id,
            'build_id' => job.source_id,
            'state' => job.state.to_s,
            'result' => job.result,
            'started_at' => format_date(job.started_at),
            'finished_at' => format_date(job.finished_at),
            'commit' => commit.commit,
            'branch' => commit.branch,
            'message' => commit.message,
            'committed_at' => format_date(commit.committed_at),
            'author_name' => commit.author_name,
            'author_email' => commit.author_email,
            'committer_name' => commit.committer_name,
            'committer_email' => commit.committer_email,
            'compare_url' => commit.compare_url,
            'worker' => job.worker
          }
        end
      end
    end
  end
end
