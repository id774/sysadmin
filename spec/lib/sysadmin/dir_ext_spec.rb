# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Dir do
  describe '#filelist' do
    context 'specity directory name' do
      subject { Dir.filelist(dir) }

      let(:dir) { File.expand_path("../../test_dir/a", File.dirname(__FILE__)) }
      it { expect(subject).to have(2).items }

      context 'if subdirectory option is true' do
        subject { Dir.filelist(dir, sub_directory = true) }

        let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }
        it { expect(subject).to have(9).items }
      end

      context 'if subdirectory option is false' do
        subject { Dir.filelist(dir, sub_directory = false) }

        let(:dir) { File.expand_path("../../test_dir/a", File.dirname(__FILE__)) }
        it { expect(subject).to have(2).items }
      end
    end

    context 'specity file name' do
      subject { Dir.filelist(file) }

      let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
      it { expect(subject).to have(1).item }

      context 'if subdirectory option is true' do
        subject { Dir.filelist(file, sub_directory = true) }

        let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
        it { expect(subject).to have(1).item }
      end

      context 'if subdirectory option is true' do
        subject { Dir.filelist(file, sub_directory = false) }

        let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
        it { expect(subject).to have(1).item }
      end
    end
  end
end
