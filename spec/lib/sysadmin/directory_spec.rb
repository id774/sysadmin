# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../../spec_helper'

describe Sysadmin::Directory do
  describe '#map' do
    context 'specify directory name' do
      subject { Sysadmin::Directory.new(dir) }
      let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }

      it 'should return file list in directory' do
        expect(subject).to have(9).items
      end
    end

    context 'specify directory name' do
      subject { Sysadmin::Directory.new(dir) }
      let(:dir) { File.expand_path("../../test_dir/a", File.dirname(__FILE__)) }

      it 'should return file list in directory' do
        expect(subject).to have(4).items
      end
    end

    context 'specify directory name' do
      subject { Sysadmin::Directory.new(dir) }
      let(:dir) { File.expand_path("../../test_dir/a/g", File.dirname(__FILE__)) }

      it 'should return file list in directory' do
        expect(subject).to have(2).items
      end
    end

    context 'specify directory name' do
      subject { Sysadmin::Directory.new(dir) }
      let(:dir) { File.expand_path("../../test_dir/b", File.dirname(__FILE__)) }

      it 'should return file list in directory' do
        expect(subject).to have(2).items
      end
    end

    context 'specify directory name with grep' do
      subject { Sysadmin::Directory.new(dir).grep(/\.txt/) }
      let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }

      it 'should return file list matching regexp' do
        expect(subject).to have(9).item
      end
    end

    context 'specify directory name with grep' do
      subject { Sysadmin::Directory.new(dir).grep(/d\.txt/) }
      let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }

      it 'should return file list matching regexp' do
        expect(subject).to have(1).item
      end
    end

    context 'specify directory name with grep and take' do
      subject { Sysadmin::Directory.new(dir).grep(/\.txt/).take(3) }
      let(:dir) { File.expand_path("../../test_dir", File.dirname(__FILE__)) }

      it 'should return picked up file list matching regexp' do
        expect(subject).to have(3).items
      end
    end

  end
end
