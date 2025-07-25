interface Props {
    params: Promise<{ projectId: string }>
}

const Page = async ({ params }: Props) => {
    const projectId = (await params).projectId;
    return (
        <div>
            Project Id: {projectId}
        </div>
    )
}