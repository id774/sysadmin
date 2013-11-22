# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Dir do
  describe '#filelist' do
    context 'specity directory name' do
      subject { Dir.filelist(dir) }

      let(:dir) { File.expand_path("../../test_dir/a", File.dirname(__FILE__)) }
      it 'should return file list in directories' do
        expect(subject).to have(2).items
      end

      context 'if subdirectory option is true' do
        subject { Dir.filelist(dir, sub_directory = true) }

        let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }
        it 'should return file name (not in sub directories)' do
         expect(subject).to have(9).items
        end
      end

      context 'if subdirectory option is false' do
        subject { Dir.filelist(dir, sub_directory = false) }

        let(:dir) { File.expand_path("../../test_dir/a", File.dirname(__FILE__)) }
        it 'should return file name not including sub directories' do
          expect(subject).to have(2).items
        end
      end
    end

    context 'specity file name' do
      subject { Dir.filelist(file) }

      let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
      it 'should return the file name' do
        expect(subject).to have(1).item
      end

      context 'if subdirectory option is true' do
        subject { Dir.filelist(file, sub_directory = true) }

        let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
        it 'should return file list including subdirectories' do
          expect(subject).to have(1).item
        end
      end

      context 'if subdirectory option is true' do
        subject { Dir.filelist(file, sub_directory = false) }

        let(:file) { File.expand_path("../../test_dir/a/d.txt", File.dirname(__FILE__)) }
        it 'should return file list not including subdirectories' do
          expect(subject).to have(1).item
        end
      end
    end
  end
end
