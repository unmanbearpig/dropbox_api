context DropboxApi::Metadata::MemberActionCollection do
  it "can be initialized from an empty Array" do
    actions = DropboxApi::Metadata::MemberActionCollection.new([])

    expect(actions).to be_a(DropboxApi::Metadata::MemberActionCollection)
  end

  it "can be initialized from a Array of String" do
    actions = DropboxApi::Metadata::MemberActionCollection.new(%w(
      remove
      leave_a_copy
    ))

    expect(actions).to be_a(DropboxApi::Metadata::MemberActionCollection)
  end

  it "can be initialized from a Array of Symbol" do
    actions = DropboxApi::Metadata::MemberActionCollection.new([
      :remove,
      :leave_a_copy
    ])

    expect(actions).to be_a(DropboxApi::Metadata::MemberActionCollection)
  end

  it "can be initialized from another MemberActionCollection" do
    actions = DropboxApi::Metadata::MemberActionCollection.new([
      :remove,
      :leave_a_copy
    ])
    actions = DropboxApi::Metadata::MemberActionCollection.new actions

    expect(actions).to be_a(DropboxApi::Metadata::MemberActionCollection)
  end

  it "can be serialized just as an Array" do
    array = [
      :remove,
      :leave_a_copy
    ]

    expect(DropboxApi::Metadata::MemberActionCollection.new(array).to_json)
      .to eq(array.to_json)
  end

  it "will raise an exception if one of the entries is invalid" do
    expect {
      DropboxApi::Metadata::MemberActionCollection.new [:invalid_action]
    }.to raise_error ArgumentError
  end
end
