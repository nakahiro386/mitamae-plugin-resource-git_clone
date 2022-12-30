module ::MItamae
  module Plugin
    module ResourceExecutor
      class GitClone < ::MItamae::ResourceExecutor::Base
        def apply

          if !current.exist && desired.exist
            cmd = ['git', 'clone']
            cmd << '--recursive' if desired.recursive
            cmd += ['--depth', depth.to_s] if desired.depth
            cmd += ['--revision', revision] if desired.revision
            cmd << '--' << desired.repository << desired.destination
            run_command(cmd)
          end
          if current.exist && !desired.exist
            run_specinfra(:remove_file, desired.destination)
          end
        end

        private

        def set_current_attributes(current, action)
          current.exist = FileTest.directory?(attributes.destination)
        end

        def set_desired_attributes(desired, action)
          case action
          when :clone
            desired.exist = true
          when :delete
            desired.exist = false
          end
        end
      end
    end
  end
end
